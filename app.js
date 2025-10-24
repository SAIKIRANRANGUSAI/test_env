// app.js
const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
require("dotenv").config(); // load .env variables
const db = require("./config/db");



const app = express();
const PORT = 3000;

// Routes
const frontendRoutes = require("./routes/frontend");
const adminRoutes = require("./routes/admin");

// View engine setup
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Middleware

app.use(express.static(path.join(__dirname, "public"))); // Static files
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use(cookieParser()); // Cookie parsing for JWT


app.use(cookieParser());

// ---------- Flash Messages via Cookies ----------
app.use((req, res, next) => {
  // expose flash messages to EJS via res.locals
  res.locals.successMessage = req.cookies.successMessage || null;
  res.locals.errorMessage = req.cookies.errorMessage || null;

  // clear the cookies so messages are shown only once
  res.clearCookie("successMessage");
  res.clearCookie("errorMessage");

  // helper function to set flash messages from routes
  res.setFlash = (type, message) => {
    // type should be 'successMessage' or 'errorMessage'
    res.cookie(type, message, { maxAge: 3000, httpOnly: true });
  };

  next();
});

// --- Dynamic SEO middleware ---
app.use(async (req, res, next) => {
  try {
    // Use route path to determine page name
    let pageName = req.path === '/' ? 'home' : req.path.substring(1); 
    // Example: '/about' -> 'about', '/contact' -> 'contact'

    const [seoRows] = await db.query(
      "SELECT * FROM seo_settings WHERE page_name = ? LIMIT 1",
      [pageName]
    );

    res.locals.seo = seoRows[0] || {
      title: 'My Loan Bazar',
      description: 'Default site description',
      keywords: 'loans, personal loan, home loan, business loan, car loan',
      author: 'My Loan Bazar',
      og_title: 'My Loan Bazar',
      og_description: 'Default OG description',
      og_image: '/images/default-og.jpg',
      og_url: 'https://myloanbazar.com',
      og_type: 'website',
      twitter_card: 'summary_large_image',
      twitter_title: 'My Loan Bazar',
      twitter_description: 'Default Twitter description',
      twitter_image: '/images/default-twitter.jpg',
      favicon_url: '/favicon.ico'
    };

    next();
  } catch (err) {
    console.error('SEO middleware error:', err);
    res.locals.seo = {}; // fallback
    next();
  }
});

// -------- SETTINGS (Frontend Header & Footer Data) -------
// Middleware to make settings available in all frontend pages
app.use(async (req, res, next) => {
  try {
    const [settings] = await db.query("SELECT * FROM settings WHERE is_active = 1 LIMIT 1");
    if (settings.length > 0) {
      res.locals.settings = settings[0]; // accessible in EJS as settings.logo_url, settings.address, etc.
    } else {
      res.locals.settings = {};
    }
    next();
  } catch (err) {
    console.error("Error loading settings:", err);
    res.locals.settings = {};
    next();
  }
});

// Public & Admin routes
app.use("/", frontendRoutes);       // Public pages
app.use("/admin", adminRoutes);     // Admin panel

// router.get('/enquiry', (req, res) => {
//     res.render('frontend/enquiry', { title: 'Enquiry' });
// });
// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
