const db = require('../config/db');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

// 🟢 POST /admin/login
// exports.postLogin = async (req, res) => {
//   const { username, password } = req.body;

//   try {
//     // Fetch admin user
//     const [rows] = await db.query("SELECT * FROM admin WHERE username = ?", [username]);

//     if (!rows.length) {
//       return res.render("admin/login", { error: "Invalid username or password" });
//     }

//     const user = rows[0];

//     // Compare password
//     const isMatch = await bcrypt.compare(password, user.password);
//     if (!isMatch) {
//       return res.render("admin/login", { error: "Invalid username or password" });
//     }

//     // Direct JWT secret
//     const jwtSecret = "12345678"; // hardcoded directly

//     // Generate JWT
//     const token = jwt.sign(
//       { id: user.id, username: user.username },
//       jwtSecret,
//       { expiresIn: "1h" }
//     );

//     // Set cookie
//     res.cookie("token", token, {
//       httpOnly: true,
//       secure: false, // disable for local dev
//       sameSite: "strict",
//       maxAge: 3600000, // 1 hour
//     });

//     // Redirect to dashboard
//     res.redirect("/admin/dashboard");

//   } catch (err) {
//     console.error("❌ Login error:", err);
//     res.status(500).render("admin/login", { error: "Server error. Please try again." });
//   }
// };

exports.postLogin = async (req, res) => {
  const { username, password } = req.body;

  try {
    // Fetch admin user
    const [rows] = await db.query("SELECT * FROM admin WHERE username = ?", [username]);

    if (!rows.length) {
      return res.render("admin/login", { error: "Invalid username or password" });
    }

    const user = rows[0];

    // Compare password
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.render("admin/login", { error: "Invalid username or password" });
    }

    // Log successful login
    const ip_address = req.headers['x-forwarded-for'] || req.connection.remoteAddress || req.ip;
    const user_agent = req.headers['user-agent'] || null;

    await db.execute(
      "INSERT INTO admin_logins (username, ip_address, user_agent) VALUES (?, ?, ?)",
      [user.username, ip_address, user_agent]
    );

    // Direct JWT secret
    const jwtSecret = "12345678"; // hardcoded directly

    // Generate JWT
    const token = jwt.sign(
      { id: user.id, username: user.username },
      jwtSecret,
      { expiresIn: "1h" }
    );

    // Set cookie
    res.cookie("token", token, {
      httpOnly: true,
      secure: false, // disable for local dev
      sameSite: "strict",
      maxAge: 3600000, // 1 hour
    });

    // Redirect to dashboard
    res.redirect("/admin/dashboard");

  } catch (err) {
    console.error("❌ Login error:", err);
    res.status(500).render("admin/login", { error: "Server error. Please try again." });
  }
};

// 🟢 GET /admin/logout
exports.logout = (req, res) => {
  res.clearCookie("token");
  res.redirect("/admin/login");
};

// 🟢 Middleware: protect admin routes
exports.isAuthenticated = (req, res, next) => {
  if (req.path === "/login" || req.path === "/logout") return next();

  const token = req.cookies.token;
  if (!token) return res.redirect("/admin/login");

  try {
    const decoded = jwt.verify(token, "12345678");
    req.user = decoded; // attach user info to request
    return next();
  } catch (err) {
    return res.redirect("/admin/login");
  }
};

// controllers/controllers.js

// exports.updateHome = async (req, res) => {
//     const { hero_header, hero_description, services_heading, services_description, current_image } = req.body;
//     let hero_image = current_image;

//     if (req.file) {
//         // Upload to Cloudinary and replace previous image
//         if(current_image) await deleteFromCloudinary(current_image);
//         const result = await uploadToCloudinary(req.file.buffer);
//         hero_image = result.secure_url;
//     }

//     await db.query(
//         "UPDATE hero_services SET hero_header=?, hero_description=?, hero_image=?, services_heading=?, services_description=? WHERE id=1",
//         [hero_header, hero_description, hero_image, services_heading, services_description]
//     );

//     const [dataRows] = await db.query("SELECT * FROM hero_services WHERE id=1");

//     res.render("admin/admin_home", { data: dataRows[0], message: "Home page updated successfully!" });
// };

