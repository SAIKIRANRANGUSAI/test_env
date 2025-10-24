// routes/frontend.js
const express = require("express");
const router = express.Router();
const db = require("../config/db");
const { body, validationResult } = require("express-validator");
const sanitizeHtml = require("sanitize-html");
const axios = require("axios");
// --------- Frontend Pages ---------

const he = require("he");

// Helper: check for dangerous patterns after decoding entities
function containsDangerousPattern(str) {
  if (!str) return false;
  const decoded = he.decode(String(str)); // decode entities like &lt;script&gt;
  // patterns: script tags, javascript: data: vbscript:, inline event handlers like onerror=
  const dangerousRe = /<\s*script\b|javascript\s*:|data\s*:|vbscript\s*:|on\w+\s*=|<\s*iframe\b/i;
  return dangerousRe.test(decoded);
}

// Helper: sanitize final string (no tags, no attributes), trim & limit length
function sanitizeAndLimit(str, maxLen = 2000) {
  if (!str) return "";
  // First decode entities to catch encoded attacks, then remove tags & attributes
  const decoded = he.decode(String(str));
  const cleaned = sanitizeHtml(decoded, {
    allowedTags: [], // no tags allowed
    allowedAttributes: {}
  });
  const trimmed = cleaned.trim();
  return trimmed.slice(0, maxLen);
}
// Home
router.get("/", async (req, res) => {
  try {
    // Fetch hero & services data (single row)
    const [rows] = await db.query("SELECT * FROM hero_services WHERE id = 1");
    const hero = rows[0] || {}; // ensure hero is always defined

    const [aboutRows] = await db.query("SELECT * FROM about_us WHERE id = 1");
    const about = aboutRows[0] || {}; // ensure about is always defined

    const [countsRows] = await db.query("SELECT * FROM home_counts WHERE id = 1");
    const homeCounts = countsRows[0] || {}; // ensure homeCounts is always defined

    const [whyRows] = await db.query("SELECT * FROM why_choose_us WHERE id = 1");
    const whyChooseUs = whyRows[0] || {};

    // Fetch testimonials section and entries
    const [sectionRows] = await db.query("SELECT * FROM testimonials_section WHERE id = 1");
    const testimonialsSection = sectionRows[0] || {};

    const [servicesRows] = await db.query("SELECT * FROM services_content WHERE id = 1");
    const services = servicesRows[0] || { heading: "", description: "" };

    const [testimonialRows] = await db.query("SELECT * FROM testimonials ORDER BY id ASC");
    const testimonials = testimonialRows || []; // fetch all, default empty array

    const [faqSectionRows] = await db.query("SELECT * FROM faq_section WHERE id = 1");
    const faqSection = faqSectionRows[0] || {};

    const [faqRows] = await db.query("SELECT * FROM faqs ORDER BY id ASC");
    const faqs = faqRows || []; // fetch all, default empty array

    const [allServicesRows] = await db.query("SELECT * FROM services ORDER BY id ASC");
    const allServices = allServicesRows || [];


    res.render("frontend/index", {
      title: "Home",
      hero, // pass hero to template
      about,
      homeCounts,
      whyChooseUs,
      testimonialsSection,
      testimonials,
      faqSection,
      faqs,
      services,
      allServices,
    });
  } catch (err) {
    console.error("Error fetching frontend home data:", err);
    res.status(500).send("Server error");
  }
});



// About
router.get("/about", async (req, res) => {
    try {
        // Fetch the first record from about_us table
        const [rows] = await db.query("SELECT * FROM about_us ORDER BY id LIMIT 1");

        const about = rows[0] || {}; // ensure 'about' is at least an empty object

        res.render("frontend/about", {
            title: "About Us",
            about
        });
    } catch (err) {
        console.error(err);
        res.status(500).send("Server Error");
    }
});

// Services
// Services Page
router.get("/services", async (req, res) => {
  try {
    // Keep current content query
    const [rows] = await db.query("SELECT heading, description FROM services_content LIMIT 1");
    const content = rows[0] || { heading: "", description: "" };

    // New: fetch all services for display (icon, heading, short_description)
    const [services] = await db.query(
      "SELECT id, icon_image, heading, short_description FROM services ORDER BY id ASC"
    );

    res.render("frontend/services", {
      title: "Services",
      heading: content.heading,
      description: content.description,
      services, // added new services data
    });
  } catch (err) {
    console.error("Database error:", err);
    res.status(500).send("Server Error");
  }
});

// Personal Loan Page
// Personal Loan Page
router.get("/personal-loan/:id", async (req, res) => {
  try {
    const serviceId = req.params.id || 1;

    // Fetch main service content (include id here!)
    const [serviceRows] = await db.query(
      "SELECT id, heading, description, short_description, icon_image, image_1, image_2 FROM services WHERE id = ?",
      [serviceId]
    );

    const service = serviceRows[0] || {
      id: 0,
      heading: "Personal Loan",
      description: "",
      short_description: "",
      icon_image: "/images/personal-loan.jpg",
      image_1: "/images/default1.jpg",
      image_2: "/images/default2.jpg",
    };

    // Fetch FAQs
    const [faqRows] = await db.query(
      "SELECT question, answer FROM services_faq WHERE service_id = ?",
      [serviceId]
    );

    res.render("frontend/personal-loan", {
      title: service.heading,
      service,
      faqs: faqRows,
    });
  } catch (err) {
    console.error("Database error:", err);
    res.status(500).send("Server Error");
  }
});

// Contact
// GET Contact Page
router.get("/contact", (req, res) => {
  res.render("frontend/contact", { 
    title: "Contact Us",
    msg: null // define it so template won't throw error
  });
});


// POST Contact Form
// POST /contact route
router.post("/contact",
  [
    body("name").trim().notEmpty().withMessage("Name is required").isLength({ max: 200 }).withMessage("Name too long"),
    body("email").trim().isEmail().withMessage("Valid email is required").normalizeEmail(),
    body("phone").trim().notEmpty().withMessage("Phone is required").isLength({ max: 50 }).withMessage("Phone too long"),
    body("subject").trim().notEmpty().withMessage("Subject is required").isLength({ max: 255 }).withMessage("Subject too long"),
    body("message").trim().notEmpty().withMessage("Message is required").isLength({ max: 4000 }).withMessage("Message too long"),
    body("g-recaptcha-response").notEmpty().withMessage("reCAPTCHA verification failed")
  ],
  async (req, res) => {
    // Basic express-validator checks
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: errors.array()[0].msg }
      });
    }

    const { name, email, phone, subject, message, "g-recaptcha-response": recaptcha } = req.body;

    try {
      // --- Verify reCAPTCHA ---
      const secretKey = process.env.RECAPTCHA_SECRET_KEY || "6Ld7auErAAAAAC1-Z0iQ10CQgpbUwWE0DRFajl7A";
      const verifyRes = await axios.post(
        `https://www.google.com/recaptcha/api/siteverify?secret=${secretKey}&response=${recaptcha}`
      );
      if (!verifyRes.data || !verifyRes.data.success) {
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Captcha verification failed. Please try again." }
        });
      }

      // --- Defensive checks (reject on dangerous patterns) ---
      // Check *decoded* inputs for suspicious/encoded attack shapes
      if (
        containsDangerousPattern(name) ||
        containsDangerousPattern(email) ||
        containsDangerousPattern(phone) ||
        containsDangerousPattern(subject) ||
        containsDangerousPattern(message)
      ) {
        // Log the attempt server-side (you can add more detail)
        console.warn("Blocked contact submission due to dangerous input patterns from IP:", req.ip);
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Your message contains disallowed content and cannot be submitted." }
        });
      }

      // --- Sanitize & limit lengths ---
      const cleanName = sanitizeAndLimit(name, 200);
      const cleanEmail = sanitizeAndLimit(email, 255);
      const cleanPhone = sanitizeAndLimit(phone, 50);
      const cleanSubject = sanitizeAndLimit(subject, 255);
      const cleanMessage = sanitizeAndLimit(message, 4000);

      // Final defensive safety: ensure no javascript: or data: remains in cleaned values
      const suspiciousLeftoverRe = /javascript\s*:|data\s*:|vbscript\s*:/i;
      if (
        suspiciousLeftoverRe.test(cleanName) ||
        suspiciousLeftoverRe.test(cleanEmail) ||
        suspiciousLeftoverRe.test(cleanPhone) ||
        suspiciousLeftoverRe.test(cleanSubject) ||
        suspiciousLeftoverRe.test(cleanMessage)
      ) {
        console.warn("Blocked contact submission due to leftover dangerous scheme after cleaning. IP:", req.ip);
        return res.render("frontend/contact", {
          title: "Contact Us",
          msg: { type: "error", text: "Your message contains disallowed content and cannot be submitted." }
        });
      }

      // --- Insert into database using parameterized query ---
      await db.query(
        "INSERT INTO contact_submissions (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)",
        [cleanName, cleanEmail, cleanPhone, cleanSubject, cleanMessage]
      );

      // Success response
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "success", text: "Your message has been sent successfully!" }
      });
    } catch (err) {
      console.error("Contact form error:", err);
      return res.render("frontend/contact", {
        title: "Contact Us",
        msg: { type: "error", text: "Something went wrong. Please try again later." }
      });
    }
  }
);

// ------------------------------
// GET: Enquiry form without serviceId (menu)
// ------------------------------
router.get("/enquiry", async (req, res) => {
  try {
    const [serviceRows] = await db.query(
      "SELECT id, heading, short_description, icon_image FROM services ORDER BY id ASC LIMIT 1"
    );
    const service = serviceRows[0] || {
      id: 0,
      heading: "General Enquiry",
      short_description: "Fill the form below for general enquiries",
      icon_image: "/default-icon.png",
    };

    const [states] = await db.query("SELECT id, name FROM states ORDER BY name");
    const [institutions] = await db.query(
      "SELECT id, type, name, logo, details FROM institutions ORDER BY type, name"
    );

    res.render("frontend/enquiry", {
      title: `${service.heading} - Enquiry`,
      service,
      states,
      institutions,
    });
  } catch (err) {
    console.error("Error fetching enquiry form:", err);
    res.status(500).send("Server Error");
  }
});

// ------------------------------
// GET: Enquiry form for specific service
// ------------------------------
router.get("/enquiry/:serviceId", async (req, res) => {
  try {
    const serviceId = req.params.serviceId;
    const [serviceRows] = await db.query(
      "SELECT id, heading, short_description, icon_image FROM services WHERE id = ?",
      [serviceId]
    );

    if (!serviceRows.length) return res.status(404).send("Service not found");

    const service = serviceRows[0];
    const [states] = await db.query("SELECT id, name FROM states ORDER BY name");
    const [institutions] = await db.query(
      "SELECT id, type, name, logo, details FROM institutions ORDER BY type, name"
    );

    res.render("frontend/enquiry", {
      title: `${service.heading} - Enquiry`,
      service,
      states,
      institutions,
    });
  } catch (err) {
    console.error("Error fetching enquiry form:", err);
    res.status(500).send("Server Error");
  }
});

// ------------------------------
// GET: Districts by state ID (AJAX)
// ------------------------------
router.get("/districts/:stateId", async (req, res) => {
  try {
    const stateId = req.params.stateId;
    if (!stateId || isNaN(stateId)) return res.status(400).json({ error: "Invalid state ID" });

    const [districts] = await db.query(
      "SELECT id, name FROM districts WHERE state_id = ? ORDER BY name",
      [stateId]
    );
    res.json(districts);
  } catch (err) {
    console.error("Error fetching districts:", err);
    res.status(500).json({ error: "Failed to fetch districts" });
  }
});

// ------------------------------
// POST: Enquiry without serviceId (menu)
// ------------------------------
router.post("/enquiry", async (req, res) => {
  try {
    const [serviceRows] = await db.query(
      "SELECT id, heading FROM services ORDER BY id ASC LIMIT 1"
    );
    const service = serviceRows[0] || { id: 0, heading: "General Enquiry" };

    await saveEnquiry(req.body, service.id, service.heading);
    res.json({ success: true, message: "Enquiry submitted successfully!" });
  } catch (err) {
    console.error("Enquiry submission error:", err);
    res.status(500).json({ success: false, message: err.message || "Server error" });
  }
});

// ------------------------------
// POST: Enquiry with serviceId
// ------------------------------
router.post("/enquiry/:serviceId", async (req, res) => {
  try {
    const serviceId = req.params.serviceId;
    const [serviceRows] = await db.query("SELECT heading FROM services WHERE id = ?", [serviceId]);
    const service_name = serviceRows[0]?.heading || "General Enquiry";

    await saveEnquiry(req.body, serviceId, service_name);
    res.json({ success: true, message: "Enquiry submitted successfully!" });
  } catch (err) {
    console.error("Enquiry submission error:", err);
    res.status(500).json({ success: false, message: err.message || "Server error" });
  }
});

async function saveEnquiry(body, serviceId, service_name) {
  const {
    name, mobile, address, pincode, gender,
    company_name, loan_amount, monthly_salary, emis, company_address,
    preferred_type, preferred_institution, otp,
    state_id, district_id
  } = body;

  // Validation
  if (!name || !mobile || !address || !pincode || !gender ||
      !company_name || !loan_amount || !monthly_salary || !emis || !company_address ||
      !preferred_type || !preferred_institution || !otp) {
    throw new Error("All fields are required");
  }
  if (!/^[6-9][0-9]{9}$/.test(mobile)) throw new Error("Invalid mobile number");
  if (!/^[1-9][0-9]{5}$/.test(pincode)) throw new Error("Invalid pincode");
  if (!/^\d{6}$/.test(otp)) throw new Error("Invalid OTP");

  // Fetch state and district names if IDs provided
  let state_name = null;
  let district_name = null;

  if (state_id) {
    const [stateRows] = await db.query("SELECT name FROM states WHERE id = ?", [state_id]);
    state_name = stateRows[0]?.name || null;
  }

  if (district_id) {
    const [districtRows] = await db.query("SELECT name FROM districts WHERE id = ?", [district_id]);
    district_name = districtRows[0]?.name || null;
  }

  // ✅ Insert into table without state_id / district_id columns
  const insertValues = [
    serviceId,
    service_name,
    name,
    mobile,
    address,
    pincode,
    gender,
    company_name,
    parseFloat(loan_amount),
    parseFloat(monthly_salary),
    parseFloat(emis),
    company_address,
    preferred_type,
    preferred_institution,
    preferred_institution, // institution_name
    state_name,
    district_name,
    1 // otp_verified
  ];

  const sql = `
    INSERT INTO enquirie_s
    (service_id, service_name, name, mobile, address, pincode, gender,
     company_name, loan_amount, monthly_salary, emis, company_address,
     preferred_type, preferred_institution, institution_name, state, district, otp_verified)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  await db.query(sql, insertValues);
}


module.exports = router;
