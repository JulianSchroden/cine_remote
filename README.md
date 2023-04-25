![Cine Remote Banner](docs/assets/cine_remote_banner.png)
<br>
<br>

<p align="center">
Cine Remote allows you to remote-control your Canon camera using its WiFi remote control capabilities.
</p>
<br>
<br>

Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [List of Supported Cameras](#list-of-supported-cameras)
- [Future Development](#future-development)

<br>

## Project Overview

In its current version, the app only supports white-listed camera models, which are currently the Canon C100II and the Canon EOS 70D.

Beware that the communication with these cameras is based on reverse engineering their protocols. Since I didn't have access to any API documentation for these protocols, there are certainly edge cases the CineRemote app does not handle correctly.

For more info on the C100II's API and my development process, check out [my blog](https://julianschroden.com/series/Exploring-the-Canon-Browser-Remote-API/1/).

<p align="center">
  <img src="docs/assets/cine_remote_teaser.gif" alt="Cine Remote Demo"/>
</p>
<br>

## Features

- **Network Discovery**: Detect nearby supported cameras.
- **Pairing**: Pair to the discovered camera and remember recently connected cameras.
- **Property control**: You can change the aperture, ISO, shutter angle and white balance.
- **Start and Stop Recording**
- **Image Capturing**
- **Property Update Handling**: The app continuously polls for property updates to keep the displayed data in sync, even when you alter a value on the camera.
- **Live View Preview**: Turn on the Live View preview to check your exposure and framing.
- **Demo Mode**: Even without a supported model, you can try out the Cine Remote app using its demo mode, which mimics the camera's responses and response times.

<br>

## List of Supported Cameras

| Model         | Protocol    | Limitations                                                                                  |
|:--------------|:------------|:---------------------------------------------------------------------------------------------|
| Canon C100II  | EosCineHttp | Image capturing not available.                                                               |
| Canon EOS 70D | PTP/IP      | Movie recording not available. The camera prohibits movie recordings when WiFi is turned on. |


<br>

## Future Development

- Improve discovery using UPNP search
- Adding support for more cameras
  - CCAPI-based cameras (modern Canon EOS models)
- Improving error handling, e. g. detecting when the camera disconnects.
- Adding overlays to the Live View Player (e.g., the rule of thirds grid)
