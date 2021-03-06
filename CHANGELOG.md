# $Cement Shoes Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

## 0.0.1

- Initial commit
- New equipment, Cement shoes, which places concrete from inventory as you walk
- New technology, Cement shoes, that unlocks the Cement shoes

## 0.0.2

- Bugfix: Hazard concrete is no longer changed
- Added new equipment, Brick shoes, that places stone paths, but never replaces concrete, and is unlocked by Cement shoes

## 0.0.3

- Bugfix: Cement shoes no longer put concrete on deep water tiles
- Added new equipment, Landfill shoes, that places landfill on water
- Shoes no longer have any effect while the player is in a vehicle
- A vehicle equipped with shoes will place tiles from its trunk as it moves
- If more brick shoes are worn than cement shoes, stone will be placed where concrete is not

## 0.0.4

- Bugfix: No longer crashes when getting into vehicle without grid or moving without armor

## 0.1.0

- Added settings to enable/disable concrete replacing stone path and stone path replacing concrete
- Added setting to control volume of tile placement sound

## 0.1.1

- Don't crash while not wearing armor

## 0.17.0

- Work on 0.17
- [IN PROGRESS] Refined concrete shoes
- [IN PROGRESS] Refactor to decrease code size