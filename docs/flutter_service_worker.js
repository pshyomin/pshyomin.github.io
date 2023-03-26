'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d49dcf9cecd6d1dd02e35264fa2adace",
"assets/AssetManifest.json": "86050c1d8360af5223bba51df782bd44",
"assets/assets/apple.png": "c1c1cb0901de059c7b1b6111a61eeb18",
"assets/assets/Apple.svg": "00587615733dd4954be85d8bf79f1d6f",
"assets/assets/flutter.svg": "59a662c262bb9fae1751abe4d13abb84",
"assets/assets/font/NotoSansKR-Black.otf": "05c077164c27fa722dcafe63ed38355e",
"assets/assets/font/NotoSansKR-Bold.otf": "e2406ff1791c401bc93e73d9e44e6d2b",
"assets/assets/font/NotoSansKR-Light.otf": "e914a10a1bd0088fb8f743fc7569749f",
"assets/assets/font/NotoSansKR-Medium.otf": "32666ae307200b0bcab5553590672bb1",
"assets/assets/font/NotoSansKR-Regular.otf": "210989664066c01d8ffdbdf56bb773cd",
"assets/assets/font/NotoSansKR-Thin.otf": "277434d967d5f33b857fc3f2dbaff15b",
"assets/assets/github.png": "a17150d90465d2bb381781ab5baf0147",
"assets/assets/github.svg": "07883e93734b98cae0f7b9c55d287250",
"assets/assets/google_play.png": "420858b32e4df5e86bbf7df442f4c8b5",
"assets/assets/Google_Play.svg": "e61eb638595960e94e96f68430f92762",
"assets/assets/icon/ask/profile.png": "2f0c22b07c21232f9646d2310bf95223",
"assets/assets/icon/ask.png": "9cdb542c9af6f53988851ed4282a0af4",
"assets/assets/icon/backend.png": "05656c151450d0bba7a72a8884830d6c",
"assets/assets/icon/calculator.png": "2461f0d9214b0bba611aa3866e8924fa",
"assets/assets/icon/csharp.svg": "fd6586faa64e4dfd0635ed4a1e5439c1",
"assets/assets/icon/dotnet.svg": "dce69d5779414f75388d4c16ea96d626",
"assets/assets/icon/flutter.svg": "ea67ff4e8060634c0008c912a810338e",
"assets/assets/icon/unity.svg": "07071db9a6d78d84321aa3d21e6ef393",
"assets/assets/icon/wafull.jpg": "c3ac72d74f7072e63a8bee8e6c5bca2b",
"assets/assets/icon/weather.png": "b33c61994945982988ff714a833c3c9e",
"assets/assets/profile.jpg": "f3ebe2e1b230a81c01af4ff8ab4da0cf",
"assets/FontManifest.json": "f70d435f0d54568b9878770ebe763778",
"assets/fonts/MaterialIcons-Regular.otf": "80e8889808000af6c09dad2fcbf2571c",
"assets/NOTICES": "bee5ae1f198eef20171f84a5d01b418f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "dee4250eb2d6abdbcb8007e280c41d2f",
"assets/packages/flutter_weather_bg_null_safety/images/cloud.webp": "849a0a8f321c14b3af35ede9808a17b5",
"assets/packages/flutter_weather_bg_null_safety/images/lightning0.webp": "8d28c99840abf552a78cade97a4cad22",
"assets/packages/flutter_weather_bg_null_safety/images/lightning1.webp": "c267264ed06f875fa86b841e4e70064a",
"assets/packages/flutter_weather_bg_null_safety/images/lightning2.webp": "f48a914f5b0560942aed70b7ea9efbf3",
"assets/packages/flutter_weather_bg_null_safety/images/lightning3.webp": "29797eeedec55c06efd7f167a74ec6ad",
"assets/packages/flutter_weather_bg_null_safety/images/lightning4.webp": "a175b2bc15e4df4bab37d5ccc43c14a0",
"assets/packages/flutter_weather_bg_null_safety/images/rain.webp": "be14922d4d3c0caa92982861045a678a",
"assets/packages/flutter_weather_bg_null_safety/images/snow.webp": "d5ce493b018954f7eefb569fe185df05",
"assets/packages/flutter_weather_bg_null_safety/images/sun.webp": "f4a3e24a77f84b97ac15f8c5b846eed1",
"assets/shaders/ink_sparkle.frag": "57f2f020e63be0dd85efafc7b7b25d80",
"canvaskit/canvaskit.js": "73df95dcc5f14b78d234283bf1dd2fa7",
"canvaskit/canvaskit.wasm": "9f96ceab0a78c512276714a2486880a0",
"canvaskit/chromium/canvaskit.js": "cc1b69a365ddc1241a9cad98f28dd9b6",
"canvaskit/chromium/canvaskit.wasm": "75851278f2f7400386503b1eb36a96bf",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "ba6e1869d2fb110eba7c1f5571dabd2e",
"canvaskit/skwasm.wasm": "92d3b1eac88136d70d637a913a4c1bce",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "12905907dad21d038f84d07e4cfb848e",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "252bc145642f206212ca52e4b1aac055",
"icons/Icon-512.png": "e0f970755e49de25ba3920fae08e4854",
"icons/Icon-maskable-192.png": "252bc145642f206212ca52e4b1aac055",
"icons/Icon-maskable-512.png": "e0f970755e49de25ba3920fae08e4854",
"index.html": "c40c3f3f3f5ea2103c15dcec7b71199f",
"/": "c40c3f3f3f5ea2103c15dcec7b71199f",
"main.dart.js": "27b81a79c84c3e8b78ffe4542c188a38",
"manifest.json": "dd0c40546d12d2b014865865194e10af",
"scripts/botd-1.1.0.js": "99a8155b029f958b7dfa1012af3b280f",
"version.json": "fe7cd75b5ca0f0322351b8f452304791"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
