importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

const firebaseConfig = {
    apiKey: "AIzaSyC-bSc9f3m9rZHHkx5eHMMs8-3p8K2jGD8",
    authDomain: "serveraccess-e87b0.firebaseapp.com",
    projectId: "serveraccess-e87b0",
    storageBucket: "serveraccess-e87b0.appspot.com",
    messagingSenderId: "594308239628",
    appId: "1:594308239628:web:b0da94a4c6779dafebf929",
    measurementId: "G-J6LBDVPMJ9"
  };
  
   firebase.initializeApp(firebaseConfig);
   const messaging = firebase.messaging();

   messaging.onBackgroundMessage((message) => {
    console.log("onBackgroundMessage", message);
   });