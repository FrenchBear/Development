// create-image.ts
// Example of typescript to create a png image created by Gemini (see Gemini nightmare.txt)

// I'd like a simple example of a typescript program creating a new 100x100 ARGB bitmap with a default black,
// transparent background, draw a blue circle of radius 40 on the middle of the bitmap, and save it to a png file.
// Explain steps to prepare the project, add libraries, compile and run. I'd like a simple project, only using
// typescript tools and npm packages, no other development environment

// Install TypeScript and Jimp
// npm install typescript jimp @types/node @types/pngjs


// jimp api reference: https://jimp-dev.github.io/jimp/api/jimp/classes/jimp/

import { Jimp } from "jimp";

// Define the properties of our image and circle
const width: number = 100;
const height: number = 100;
const radius: number = 40;

// Calculate the center of the bitmap
const centerX: number = width / 2;
const centerY: number = height / 2;

// Define colors in RGBA hex format 0xRRGGBBAA
const backgroundColor: number = 0x00000000; // Black, fully transparent
const circleColor: number = 0x0000FFFF;     // Blue, fully opaque

async function createImageWithCircle() {
  try {
    console.log('Creating a new image...');
    const image = await new Jimp({width: width, height: height, color: backgroundColor});

    console.log('Drawing a blue circle...');
    for (let x = 0; x < width; x++) {
      for (let y = 0; y < height; y++) {
        const distance = Math.sqrt(Math.pow(x - centerX, 2) + Math.pow(y - centerY, 2));

        if (distance <= radius) {
          image.setPixelColor(circleColor, x, y);
        }
      }
    }

    const outputFileName = 'circle.png';
    //await image.writeAsync(outputFileName);
	image.write(outputFileName);

    console.log(`✅ Image successfully created and saved as ${outputFileName}`);

  } catch (error) {
    console.error('An error occurred:', error);
  }
}

createImageWithCircle();