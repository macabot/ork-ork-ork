SRC_LY      := src/ork-ork-ork.ly
SRC_MP3     := src/ork-ork-ork.mp3
BUILD_DIR   := build
DIST_DIR    := dist
OUTPUT_NAME := macabot-ork-ork-ork

.PHONY: all clean

all: $(DIST_DIR)/$(OUTPUT_NAME).pdf $(DIST_DIR)/$(OUTPUT_NAME).svg $(DIST_DIR)/$(OUTPUT_NAME).mp3

# Ensure build and dist directories exist
$(BUILD_DIR) $(DIST_DIR):
	mkdir -p $@

# Compile PDF
$(BUILD_DIR)/$(OUTPUT_NAME).pdf: $(SRC_LY) | $(BUILD_DIR)
	lilypond -dno-point-and-click -o $(BUILD_DIR)/$(OUTPUT_NAME) $(SRC_LY)

# Compile SVG
# It wraps the lilypond file with one that sets one-page-breaking.
# This ensures we create a single SVG.
$(BUILD_DIR)/$(OUTPUT_NAME).svg: $(SRC_LY) | $(BUILD_DIR)
	printf '\\version "2.24.3"\n\\include "%s"\n\\paper { page-breaking = #ly:one-page-breaking }\n' "$(SRC_LY)" | \
	lilypond -dbackend=svg -dno-point-and-click -o $(BUILD_DIR)/$(OUTPUT_NAME) -

# Copy PDF to dist
$(DIST_DIR)/$(OUTPUT_NAME).pdf: $(BUILD_DIR)/$(OUTPUT_NAME).pdf | $(DIST_DIR)
	cp $< $@

# Copy SVG to dist
$(DIST_DIR)/$(OUTPUT_NAME).svg: $(BUILD_DIR)/$(OUTPUT_NAME).svg | $(DIST_DIR)
	cp $< $@

# Copy Static Performance Audio to dist
$(DIST_DIR)/$(OUTPUT_NAME).mp3: $(SRC_MP3) | $(DIST_DIR)
	cp $< $@

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
