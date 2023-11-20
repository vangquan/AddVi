# Video Processing with Bible Citations

This repository contains scripts for adding Bible citations to video files. The primary purpose is to overlay Bible citation text onto videos, enhancing them with relevant information.

## Quick Action (macOS)

The `AddVi` Quick Action script is designed for macOS systems as a Quick Action Service. It utilizes FFmpeg to process video files and add Bible citation text. The processed videos are saved with "_Vi" appended to the filename.

### Features:

- Extracts citation text from video filenames.
- Supports multiple translations for Bible book names.
- Downloads the required font file (NotoSans-Bold.ttf) if not already present.
- Uses AppleScript for optional user interaction to confirm or modify citation text.
- Normalizes citation text to composed Unicode characters.

### Usage:

1. Ensure dependencies are installed (`curl`, `perl`, `ffmpeg`).
2. Provide the path to the video file when prompted.
3. The script extracts information from the filename, adds Bible citation text, and overlays it onto the video.
4. The processed video is saved in the same directory with "_Vi" appended to the filename.

### Installation

1. **Download the Latest Release:**
   - Visit the [Releases](https://github.com/vangquan/AddVi/releases) page.
   - Download the ZIP file of the latest release, e.g., `AddVi_2023-11-20.workflow.zip`.

2. **Extract the Workflow:**
   - Unzip the downloaded file, and you'll find `AddVi_2023-11-20.workflow` folder.

3. **Install the Quick Action:**
   - Double-click on `AddVi_2023-11-20.workflow` to install the Quick Action.

4. **Run the Quick Action:**
   - Once installed, you can use the Quick Action by right-clicking on a video file and selecting "AddVi" from the context menu.

**Note:** Make sure your system allows the installation of unsigned Quick Actions. You might need to adjust your security settings to run custom Quick Actions.

Feel free to customize the instructions further based on your preferences or any specific details you want to highlight.

### Dependencies:

* `curl`: Used to download the NotoSans-Bold.ttf font file.
* `perl`: Used for text replacement in the citation text.
* `ffmpeg`: Used for video processing, including text overlay and delogo filter.

### Font Information:

The NotoSans-Bold.ttf font is used for text overlay. It is downloaded if not already present.
Font source: [NotoSans-Bold.ttf](https://b.jw-cdn.org/fonts/noto-sans/2.007-edcd458/hinted/NotoSans-Bold.ttf)

### Notes:

* The script uses AppleScript (commented out) to allow user interaction for citation text confirmation. Uncomment the corresponding lines if you want to enable this interaction.
* Original video files are not deleted by default; you can uncomment the "rm" command if desired.
* Unicode normalization: The script utilizes Python to convert Unicode text from Normalization Form D (NFD) to Normalization Form C (NFC) for consistent and composed Unicode characters. This ensures compatibility with various text processing and rendering systems.

### Windows Script (Coming Soon)

A similar script for Windows will be added to this repository soon, providing cross-platform support for video processing.

Feel free to customize and improve the scripts based on your needs. Contributions are welcome!

### License:

This project is licensed under the MIT License.
