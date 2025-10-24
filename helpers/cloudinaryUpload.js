const cloudinary = require("../config/cloudinary");
const { Readable } = require("stream");

// Upload buffer to Cloudinary
exports.uploadToCloudinary = (fileBuffer, folder = "hero_images") => {
  return new Promise((resolve, reject) => {
    const stream = cloudinary.uploader.upload_stream(
      { folder },
      (error, result) => {
        if (error) return reject(error);
        resolve(result); // result.secure_url contains the image URL
      }
    );
    const readable = new Readable();
    readable.push(fileBuffer);
    readable.push(null);
    readable.pipe(stream);
  });
};

// Delete image from Cloudinary by public URL
exports.deleteFromCloudinary = async (imageUrl) => {
  if (!imageUrl) return;
  try {
    const publicId = imageUrl
      .split("/")
      .slice(-1)[0]
      .split(".")[0]; // extract file name without extension
    await cloudinary.uploader.destroy(`hero_images/${publicId}`);
  } catch (err) {
    console.error("Error deleting from Cloudinary:", err);
  }
};
