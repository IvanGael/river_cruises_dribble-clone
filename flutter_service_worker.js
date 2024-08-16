'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6db16a99e1db90b9b99a0e95ee0801c1",
"assets/AssetManifest.bin.json": "c3cf5cfc4e6007100f5c2bc9eba618df",
"assets/AssetManifest.json": "92282794ffd374add52ec79d6162f704",
"assets/assets/fonts/PetrovSans-Black.ttf": "5a1c06e32f9523bc4fa46fe8b2139c65",
"assets/assets/fonts/PetrovSans-BlackItalic.ttf": "e754b1b79b35eafca91ce7a4c100089c",
"assets/assets/fonts/PetrovSans-Bold.ttf": "fb53f3deff8429b6c1d11c2c09ca9787",
"assets/assets/fonts/PetrovSans-BoldItalic.ttf": "27e39069353c8b77806e41338fa8427e",
"assets/assets/fonts/PetrovSans-Book.ttf": "b49e9f7ee583b7acbba0adc77fabe58a",
"assets/assets/fonts/PetrovSans-BookItalic.ttf": "83d216e29182d83ece2c009db850ef04",
"assets/assets/fonts/PetrovSans-ExtraBold.ttf": "aba6440107f5a433d6e672044f747afd",
"assets/assets/fonts/PetrovSans-ExtraBoldItalic.ttf": "440b3eda2a2e7eb8f254f853d4e186fc",
"assets/assets/fonts/PetrovSans-ExtraLight.ttf": "b93cb762fae35bbcdca4a21fd6e8b589",
"assets/assets/fonts/PetrovSans-ExtraLightItalic.ttf": "d3dfe058ed30581fcd9032711378f4ab",
"assets/assets/fonts/PetrovSans-Light.ttf": "c535cc1a626a84197d6a22edfd76d102",
"assets/assets/fonts/PetrovSans-LightItalic.ttf": "2abd976d6715c8d7cd82b34f368bb091",
"assets/assets/fonts/PetrovSans-Regular.ttf": "7ccb325efa6056c304546a85db47c620",
"assets/assets/fonts/PetrovSans-RegularItalic.ttf": "ffb9dffad8b92955fe5e4a1b287cc754",
"assets/assets/fonts/PetrovSans-SemiBold.ttf": "10e24ebadf34271803f67520bcb9d0c4",
"assets/assets/fonts/PetrovSans-SemiBoldItalic.ttf": "6f75b66149b50da4f34f3e52308e6f15",
"assets/assets/fonts/PetrovSans-Thin.ttf": "70a8743ff8d5e9c0c4811fd376a714a4",
"assets/assets/fonts/PetrovSans-ThinItalic.ttf": "6160546d9f373f817a9d6360f9d9a3d7",
"assets/assets/images/bgd.png": "d4af86c85c4d294af5b1312a53f28368",
"assets/assets/images/boat.png": "6eaa28da0ceae82aa39bfc0136c2172f",
"assets/assets/images/boat2.png": "4ef5d69d56aeec325414d6009f71bcce",
"assets/assets/images/car.png": "09cbb4805ef2766abc081c265c03446b",
"assets/assets/images/cruise1.jpg": "2855cb45a58ee1d79b2013b2b9335ce5",
"assets/assets/images/cruise10.jpg": "e91da90d8f556d0862b71d47dbf5afbb",
"assets/assets/images/cruise11.jpg": "d2b093edce18e18f25a959ef46f47522",
"assets/assets/images/cruise12.jpg": "61754600e0dc819444774d7d5e0adc2e",
"assets/assets/images/cruise13.jpg": "d096fd131e596044eaf8d935e7e544ee",
"assets/assets/images/cruise14.jpg": "6f93e9d1ee78362aec1c9b2280203219",
"assets/assets/images/cruise15.jpg": "e41aed6ce3d603e696ed8c4534b4ca23",
"assets/assets/images/cruise16.jpg": "d5d0365ec41bee5a5779f1a32db71db8",
"assets/assets/images/cruise17.jpg": "286ad4b59acbb433fe9a8e9eace3ee5c",
"assets/assets/images/cruise18.jpg": "b19f7bc93b3525a8c47a451daa57f140",
"assets/assets/images/cruise19.jpg": "375dd6361371e57572d215e732bf9558",
"assets/assets/images/cruise2.jpg": "e1df7d0787598d903a8f996e9c1a3ec9",
"assets/assets/images/cruise20.jpg": "c15c942c8213cc2a40339300b5922930",
"assets/assets/images/cruise21.jpg": "30fad937b751b1d9e3ef8e741fd72762",
"assets/assets/images/cruise3.jpg": "0ecdc40d4033995d52ee35bb0bc38144",
"assets/assets/images/cruise4.jpg": "e21b05192c674dd8ce2f733efd3b35aa",
"assets/assets/images/cruise5.jpg": "8f61ffefba136c9c5ff99697ccd656a5",
"assets/assets/images/cruise6.jpg": "46387588ce0ba9441703400db642443b",
"assets/assets/images/cruise7.jpg": "25b2c1914eb55b12c9e240d853acc206",
"assets/assets/images/cruise8.jpg": "958c4e631e89ee5e1982754de34d5941",
"assets/assets/images/cruise9.jpg": "e9497bcc2dec4d896ee95c22525e6b01",
"assets/assets/images/glasses.png": "43b721e8f0e7e0434098ee3f8a559b48",
"assets/FontManifest.json": "de538698f99d1b7c91997c6d9feb5069",
"assets/fonts/MaterialIcons-Regular.otf": "7b8efa592b8ef360070cf349f41a28fe",
"assets/NOTICES": "207c6af8e150d437f73ffe7f7cd84198",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "d03825a61a52c96f2ae401a7bfa8bc27",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1042d7e0b097339502d5cae3fcaae9a5",
"/": "1042d7e0b097339502d5cae3fcaae9a5",
"main.dart.js": "e580e8c49e268050c1f8dbb2b426c2bc",
"manifest.json": "0b004279a5325d2797766692619659c3",
"version.json": "5d3664e80479c2cb97af41a6077b31f3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
