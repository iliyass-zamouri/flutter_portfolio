'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "21b179dc99a2636cc866f5dbaef272fa",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-Black.ttf": "027b039d522c2ec7528a87814988c75c",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-BlackItalic.ttf": "25ccbe43b75f06c2f18453ddeec3ecce",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-Bold.ttf": "7496d5dacb54f050ac73a8ced55fd3a8",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-BoldItalic.ttf": "67eafdcba8c85f94e797d5298bce9785",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-Book.ttf": "25a14223f6c36fdfbd7918329dba46d8",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-BookItalic.ttf": "4e5804514c303efe9811d7aa456ef7c0",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-Light.ttf": "a5d94cad2c0265da66a0cea94e8346b8",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-LightItalic.ttf": "5a05f2f203f825fedb62ef9d9d46b443",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-Medium.ttf": "76e794ed439871f6fd69673bcf514e64",
"assets/assets/fonts/Circular-Spotify/CircularSpotifyTxt-MediumItalic.ttf": "b188941ea344fc0f28279d22d04b30b6",
"assets/assets/images/SpotifyRed.png": "5cc4546bbbd1c53c58eab13b75f6ba00",
"assets/assets/images/SpotifyRedAppLogo.png": "d007b35003ef6b149b6460a8318af054",
"assets/assets/images/SpotifyWhite.png": "d0d7f78423891fc622d41aa0d82630b5",
"assets/assets/images/SpotifyWhite.svg": "a49835fb8ad369e77cb36cc4c15fcff4",
"assets/FontManifest.json": "9958f5f9ca04fe6d680a336e58d71221",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "11e60c5e0932efc4eacaa2de766b8627",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_remix/lib/fonts/FlutterRemix.ttf": "7a8463dd48e4ee9c6e5bb57651b77ae4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/line_awesome_flutter/lib/fonts/LineAwesome.ttf": "bcc78af7963d22efd760444145073cd3",
"favicon.ico": "f7e05095eb1803137651e1e87d054f7c",
"icons/Icon-192.png": "498e08d742ffa3ea9432ef08fc60fe2e",
"icons/Icon-512.png": "762d7dbf2936b086fea7a0634228dea4",
"icons/Icon-maskable-192.png": "498e08d742ffa3ea9432ef08fc60fe2e",
"icons/Icon-maskable-512.png": "762d7dbf2936b086fea7a0634228dea4",
"index.html": "1c93cc7dd58cf7b9ceb09fc5529f247e",
"/": "1c93cc7dd58cf7b9ceb09fc5529f247e",
"main.dart.js": "961fa4165c5a951d844f231fd4a663a8",
"manifest.json": "6677e43178f0e71be45a26fc230c66a9",
"version.json": "07dcd29faeb15b75cbedf31fd34f10ae"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
