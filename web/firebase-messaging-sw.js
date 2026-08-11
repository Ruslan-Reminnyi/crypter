importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyBO9OODmnkNHqMduducWjS1iNbv_BSyre8",
  authDomain: "crypter-a65b8.firebaseapp.com",
  projectId: "crypter-a65b8",
  storageBucket: "crypter-a65b8.firebasestorage.app",
  messagingSenderId: "667865093938",
  appId: "1:667865093938:web:7a67ea5394e7fbef00e92b",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log("Received background message: ", payload);
});
