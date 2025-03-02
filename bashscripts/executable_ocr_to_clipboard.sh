#!/bin/sh

flameshot gui --raw | tesseract stdin stdout | clip -in -selection clipboard