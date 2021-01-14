# TWRP Device configuration for Motorola One Hyper

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.0 GHz Kryo 460 Gold & 6x1.7 GHz Kryo 460 Silver)
CHIPSET | Qualcomm SM6150 Snapdragon 675
GPU     | Adreno 620
Memory  | 4GB
Shipped Android Version | 10
Storage | 128GB
Battery | 4000 mAh
Dimensions | 161.8 x 76.6 x 8.9 mm
Display | 1080 x 2340 pixels, 6.5" IPS LCD
Rear Camera  | 64 MP (f/1.8) + 8 MP (f/2.2)
Front Camera | 32 MP (f/2.0)

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-one-hyper-4.jpg)

### Kernel Source



### How to compile

```sh
. build/envsetup.sh
export LC_ALL=C
lunch omni_def-eng
make -j4 recoveryimage
```

### Copyright
 ```
  /*
  *  Copyright (C) 2013-21 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
