// // import { v2 as cloudinary } from "cloudinary";
// const cloudinary = require("cloudinary").v2;
// cloudinary.config({
//   cloud_name: "dhuzvzyut",
//   api_key: "137541939741886",
//   api_secret: "md1qaE-t6Zrck4vD18N-vlQtT6M",
// });

// // export default cloudinary;
// module.exports = cloudinary;

const cloudinary = require("cloudinary").v2;
require("dotenv").config();

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

module.exports = cloudinary;


