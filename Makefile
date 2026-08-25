# Makefile for ork-ork-ork

SRC = src/ork-ork-ork.ly
BUILD_DIR = build
DIST_DIR = dist
TARGET_NAME = ork-ork-ork

# SoundFont path (Default for Ubuntu/Debian after apt install fluid-soundfont-gm)
SOUNDFONT ?= /usr/share/sounds/sf2/FluidR3_GM.sf2

.PHONY: all clean

all: $(DIST_DIR)/$(TARGET_NAME).pdf $(DIST_DIR)/$(TARGET_NAME).svg $(DIST_DIR)/$(TARGET_NAME).midi $(DIST_DIR)/$(TARGET_NAME).mp3

# Ensure build and dist directories exist
$(BUILD_DIR) $(DIST_DIR):
	mkdir -p $@

# 1. Compile PDF and MIDI (Standard LilyPond run with normal page breaks)
$(BUILD_DIR)/$(TARGET_NAME).pdf $(BUILD_DIR)/$(TARGET_NAME).midi: $(SRC) | $(BUILD_DIR)
	lilypond -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) $(SRC)

# 2. Compile SVG (Injects one-page-breaking ONLY for this web run)
$(BUILD_DIR)/$(TARGET_NAME).cropped.svg: $(SRC) | $(BUILD_DIR)
	printf '\\include "%s"\n\\paper { page-breaking = #ly:one-page-breaking }\n' "$(SRC)" | \
	lilypond -dbackend=svg -dcrop -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) -

# Copy PDF to dist
$(DIST_DIR)/$(TARGET_NAME).pdf: $(BUILD_DIR)/$(TARGET_NAME).pdf | $(DIST_DIR)
	cp $< $@

# Copy MIDI to dist
$(DIST_DIR)/$(TARGET_NAME).midi: $(BUILD_DIR)/$(TARGET_NAME).midi | $(DIST_DIR)
	cp $< $@

# Copy Cropped SVG to dist
$(DIST_DIR)/$(TARGET_NAME).svg: $(BUILD_DIR)/$(TARGET_NAME).cropped.svg | $(DIST_DIR)
	cp $< $@

# Convert MIDI to MP3 using FluidSynth and FFmpeg
$(DIST_DIR)/$(TARGET_NAME).mp3: $(BUILD_DIR)/$(TARGET_NAME).midi | $(DIST_DIR)
	fluidsynth -ni $(SOUNDFONT) $< -F $(BUILD_DIR)/$(TARGET_NAME).raw -r 44100
	ffmpeg -y -f s16le -ar 44100 -ac 2 -i $(BUILD_DIR)/$(TARGET_NAME).raw $@
	rm -f $(BUILD_DIR)/$(TARGET_NAME).raw

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
