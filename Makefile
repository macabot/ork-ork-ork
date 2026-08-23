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

# 1. Generate PDF and MIDI (Standard LilyPond run)
$(BUILD_DIR)/$(TARGET_NAME).pdf $(BUILD_DIR)/$(TARGET_NAME).midi: $(SRC) | $(BUILD_DIR)
	lilypond -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) $(SRC)

# 2. Generate SVG (Separate --svg run)
$(BUILD_DIR)/$(TARGET_NAME).svg: $(SRC) | $(BUILD_DIR)
	lilypond --svg -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) $(SRC)

# Copy PDF to dist
$(DIST_DIR)/$(TARGET_NAME).pdf: $(BUILD_DIR)/$(TARGET_NAME).pdf | $(DIST_DIR)
	cp $< $@

# Copy MIDI to dist
$(DIST_DIR)/$(TARGET_NAME).midi: $(BUILD_DIR)/$(TARGET_NAME).midi | $(DIST_DIR)
	cp $< $@

# Copy SVG to dist (handling single-page vs multi-page output)
$(DIST_DIR)/$(TARGET_NAME).svg: $(BUILD_DIR)/$(TARGET_NAME).svg | $(DIST_DIR)
	if [ -f $(BUILD_DIR)/$(TARGET_NAME).svg ]; then \
		cp $(BUILD_DIR)/$(TARGET_NAME).svg $@; \
	else \
		cp $(BUILD_DIR)/$(TARGET_NAME)-1.svg $@; \
	fi

# Convert MIDI to MP3 using FluidSynth and FFmpeg
$(DIST_DIR)/$(TARGET_NAME).mp3: $(BUILD_DIR)/$(TARGET_NAME).midi | $(DIST_DIR)
	fluidsynth -ni $(SOUNDFONT) $< -F $(BUILD_DIR)/$(TARGET_NAME).raw -r 44100
	ffmpeg -y -f s16le -ar 44100 -ac 2 -i $(BUILD_DIR)/$(TARGET_NAME).raw $@
	rm -f $(BUILD_DIR)/$(TARGET_NAME).raw

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
