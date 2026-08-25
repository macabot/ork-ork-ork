# Makefile for ork-ork-ork

SRC_LY = src/ork-ork-ork.ly
SRC_MP3 = src/ork-ork-ork.mp3
BUILD_DIR = build
DIST_DIR = dist
TARGET_NAME = ork-ork-ork

.PHONY: all clean

all: $(DIST_DIR)/$(TARGET_NAME).pdf $(DIST_DIR)/$(TARGET_NAME).svg $(DIST_DIR)/$(TARGET_NAME).mp3

# Ensure build and dist directories exist
$(BUILD_DIR) $(DIST_DIR):
	mkdir -p $@

# Compile PDF
$(BUILD_DIR)/$(TARGET_NAME).pdf: $(SRC_LY) | $(BUILD_DIR)
	lilypond -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) $(SRC_LY)

# Compile SVG
# It wraps the lilypond file with one that sets one-page-breaking.
# This ensures proper spacing between would-be pages.
$(BUILD_DIR)/$(TARGET_NAME).cropped.svg: $(SRC_LY) | $(BUILD_DIR)
	printf '\\version "2.24.3"\n\\include "%s"\n\\paper { page-breaking = #ly:one-page-breaking }\n' "$(SRC_LY)" | \
	lilypond -dbackend=svg -dcrop -dno-point-and-click -o $(BUILD_DIR)/$(TARGET_NAME) -

# Copy PDF to dist
$(DIST_DIR)/$(TARGET_NAME).pdf: $(BUILD_DIR)/$(TARGET_NAME).pdf | $(DIST_DIR)
	cp $< $@

# Copy Cropped SVG to dist
$(DIST_DIR)/$(TARGET_NAME).svg: $(BUILD_DIR)/$(TARGET_NAME).cropped.svg | $(DIST_DIR)
	cp $< $@

# Copy Static Performance Audio to dist
$(DIST_DIR)/$(TARGET_NAME).mp3: $(SRC_MP3) | $(DIST_DIR)
	cp $< $@

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
