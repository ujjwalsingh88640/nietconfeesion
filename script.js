import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
import { 
    getFirestore, collection, addDoc, onSnapshot, query, orderBy, serverTimestamp 
} from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";

// 🚨 Your exact Firebase Keys
const firebaseConfig = {
    apiKey: "AIzaSyCkvc5FhBhKfUJL3ZbGi4ds3lVDWDduKcs",
    authDomain: "campus1-87cdc.firebaseapp.com",
    projectId: "campus1-87cdc",
    storageBucket: "campus1-87cdc.firebasestorage.app",
    messagingSenderId: "428407156924",
    appId: "1:428407156924:web:814d7c832089b33e43e0b9",
    measurementId: "G-MM1QZ3RNS1"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);
const confessionsRef = collection(db, "wall_confessions");

// DOM Elements
const grid = document.getElementById('confessions-grid');
const countBadge = document.getElementById('live-count');
const modal = document.getElementById('post-modal');
const form = document.getElementById('confession-form');

// Modal Logic
document.getElementById('open-modal-btn')?.addEventListener('click', () => {
    modal.classList.add('active');
});
document.getElementById('close-modal-btn')?.addEventListener('click', () => {
    modal.classList.remove('active');
    form.reset();
});

// Map categories to the specific emojis and CSS classes used in your UI
const categoryMap = {
    "Love":  { emoji: "❤️", cssClass: "love" },
    "Funny": { emoji: "😂", cssClass: "funny" },
    "Rant":  { emoji: "😤", cssClass: "rant" },
    "Study": { emoji: "📚", cssClass: "study" },
    "Other": { emoji: "🤫", cssClass: "other" }
};

// Listen for Live Updates
const q = query(confessionsRef, orderBy("timestamp", "desc"));
onSnapshot(q, (snapshot) => {
    if(!grid) return; // Only run if on feed.html page

    grid.innerHTML = ''; // Clear loading text
    countBadge.innerText = snapshot.size; // Update live count

    if(snapshot.empty) {
        grid.innerHTML = `<p style="text-align:center; width:100%; color:var(--text-muted);">The wall is empty. Be the first to whisper.</p>`;
        return;
    }

    // Loop through database and build the beautiful HTML cards
    snapshot.forEach((docSnap) => {
        const data = docSnap.data();
        const idShort = docSnap.id.substring(0, 4).toUpperCase(); // Create a #ID
        const catInfo = categoryMap[data.category] || categoryMap["Other"];

        const article = document.createElement('article');
        article.className = `confession-card card--${catInfo.cssClass}`;
        
        article.innerHTML = `
            <span class="card-number">#${idShort}</span>
            <div class="card-top">
                <span class="category-tag tag--${catInfo.cssClass}">
                    ${catInfo.emoji} ${data.category}
                </span>
            </div>
            <p class="card-text">${data.text}</p>
            <div class="card-footer">
                <span class="likes-badge">
                    <span class="heart-icon">❤️</span> 
                    ${data.likes || 0} likes
                </span>
                <span class="anon-tag">🕶 Anonymous</span>
            </div>
        `;
        grid.appendChild(article);
    });
});

// Submit a new Confession
form?.addEventListener('submit', async (e) => {
    e.preventDefault();
    const btn = document.getElementById('submit-btn');
    btn.innerText = "Posting...";
    btn.disabled = true;

    try {
        await addDoc(confessionsRef, {
            category: document.getElementById('confession-category').value,
            text: document.getElementById('confession-text').value.trim(),
            likes: 0,
            timestamp: serverTimestamp()
        });
        
        modal.classList.remove('active');
        form.reset();
    } catch (error) {
        console.error("Error adding post: ", error);
        alert("Failed to post confession.");
    } finally {
        btn.innerText = "Post Anonymously";
        btn.disabled = false;
    }
});
