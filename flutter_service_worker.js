'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "c7d791cfb48841649a303f962479b57c",
"main.dart.js": "97da6648790e78f6b605ea5b171e696a",
"index.html": "36a99a07eda8a146e9a490b0698e2347",
"/": "36a99a07eda8a146e9a490b0698e2347",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"manifest.json": "7b63368295d3888cb0baa881b79a0e99",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"assets/AssetManifest.json": "5b7eb10d10a55893908f3e7b1336f445",
"assets/shaders/ink_sparkle.frag": "b543cd0476894d925a65522154ebe458",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "174c02fc4609e8fc4389f5d21f16a296",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/FontManifest.json": "4adf0078c41e525708b6a22204f12e2b",
"assets/assets/loading.json": "902676e1680d5dace4b1ebfc3e910a67",
"assets/assets/firebase.png": "cb39a483073142b88fa92f7539df8bed",
"assets/assets/dart.png": "7a0cddaf66ee751a2b6e3fac9357020b",
"assets/assets/back.png": "14100f76a5e4968429bbfc154468552d",
"assets/assets/git.png": "62311999bf9fb74998f2c0861d0bfc7c",
"assets/assets/Erick_Namukolo_CV.pdf": "3f11181203ce2d46764a2e3f4a449c3e",
"assets/assets/19362653.png": "85f710ed277dda139171a4882c3967bf",
"assets/assets/programming-code-signs.png": "e5ab42205e981061051c4576400ef8de",
"assets/assets/avatar.png": "05798dc10c0cf02ee9eccce56a4135fe",
"assets/assets/sqlite.png": "64c70858fc1f4b91e1b78e3b985fc262",
"assets/assets/github.png": "7638cf64b649ae24023e89acfadd3365",
"assets/assets/male.json": "821a585f696b8e48d1544721b7b8902e",
"assets/assets/css3.png": "dd63c22d4082acf71b4cfc2324ec1961",
"assets/assets/sass.png": "c2399ab7175a5bcd82f08e3d8180c14d",
"assets/assets/nodejs.png": "a8c3d96bca11c7ef661165d068f02987",
"assets/assets/flutter.png": "e95ed7dd9c2c4dda38e075564ec309e3",
"assets/assets/whatsapp.png": "43ce2ebe73a5308ce345ce1de2695aef",
"assets/assets/serious.png": "8888a5d2f2178a156dbe1098f984589a",
"assets/assets/javascript.png": "51ccf23737c36fe563a7c90cb8c3b2e0",
"assets/assets/home.json": "f82c99f7c949346e8652a723df7d94e5",
"assets/assets/web-development.png": "6bcdd15bb46a0339d72a544b983cf5aa",
"assets/assets/placeholder.png": "8e6aa1a74759fcb80402d9858e845fb8",
"assets/assets/dash.png": "e71c237537197e35d91a979803735123",
"assets/assets/mongo.png": "fa29aaffe5eb21ce7810c97a71d5d8b5",
"assets/assets/svgg.png": "3325801d39e3818bef359b26363815f4",
"assets/assets/postman.png": "96211e594c46e1ca71795dbdd1851cf5",
"assets/assets/react.png": "7b589ae0e4f42057e131ce1a3d5cb9e8",
"assets/assets/fonts/bauhaus/Bauhaus-Regular.ttf": "3066b11123e63381b8e2aa554b18bf32",
"assets/assets/fonts/poppins/Poppins-Regular.ttf": "8b6af8e5e8324edfd77af8b3b35d7f9c",
"assets/assets/vector.png": "fd24b5956c29480268efbff90d1c4e4b",
"assets/assets/linkedin-logo.png": "b6910bfaf1e9c017536402f0acd01c3e",
"assets/assets/html5.png": "3768ce284d6bfa71a327027da8095365",
"assets/assets/result.svg": "ec404a8dde534b461498f43e29d7b1d2",
"assets/assets/adobe-xd.png": "e1481938226814f38846872addad6c07",
"assets/assets/api.png": "3b952709d706e8799cba473831560169",
"assets/assets/lottie.zip": "eaaa91db69d56aa96027e980ee537958",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "b67e261f7cfed2641308226450a9893b",
"version.json": "009c9e65172e010890f7f65fde438006",
"icons/Icon-512.png": "9dae152dc63b03f29ed3f0cdfdfbeabb",
"icons/Icon-192.png": "505917003d66e59ac06c2e75d7dfba77",
"icons/Icon-maskable-192.png": "505917003d66e59ac06c2e75d7dfba77",
"icons/Icon-maskable-512.png": "9dae152dc63b03f29ed3f0cdfdfbeabb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
