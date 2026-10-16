# Thin Film Interference Simulator

An interactive 3D visualization of thin-film interference built with SvelteKit,
Threlte, and Three.js. Adjust the optical properties of the surrounding media
and the film to explore how thickness, wavelength, and refractive index affect
the simulation.

The simulation is based on this video: : (Youtube Link)[https://www.youtube.com/watch?v=xjMjWtntm9k]

## Features

- Real-time 3D scene rendered with Three.js through Threlte.
- Orbit, pan, and zoom controls for inspecting the scene.
- Adjustable refractive indices for the outside medium, thin film, and inside
  medium.
- Adjustable film thickness, wavelength, and interference order (`m`).
- Animated wave visualization.

## Getting started

### Prerequisites

- Node.js (the current LTS release is recommended)
- npm

### Installation

Clone the repository, then install its dependencies:

```sh
git clone https://github.com/roganmoffat/thin-film-interference-sim.git
cd thin-film-interference-sim
npm install
```

### Run the development server

```sh
npm run dev
```

Open the local URL printed by Vite, typically
[`http://localhost:5173`](http://localhost:5173).

You can also try the simulator online at
[`roganmoffat.github.io/thin-film-interference-sim`](https://roganmoffat.github.io/thin-film-interference-sim/).

## Using the simulator

Use the controls on the right side of the page to adjust the following values:

| Parameter | Description | Units |
| --- | --- | --- |
| `n_outside` | Refractive index of the medium before the film | — |
| `n_film` | Refractive index of the thin film | — |
| `n_inside` | Refractive index of the medium after the film | — |
| `thickness` | Thickness of the thin film | nm |
| `wavelength` | Wavelength of the displayed wave | nm |
| `m_value` | Interference order shown on the film | — |

Drag the scene to rotate the camera, pan to reposition it, and use the scroll
wheel to zoom.

## Available commands

| Command | Description |
| --- | --- |
| `npm run dev` | Start the Vite development server |
| `npm run build` | Create a production build |
| `npm run preview` | Preview the production build locally |
| `npm run check` | Run Svelte and TypeScript checks |
| `npm run lint` | Check formatting and lint rules |
| `npm run format` | Format the project with Prettier |
| `npm run test:unit` | Run unit and component tests with Vitest |
| `npm run test:e2e` | Run end-to-end tests with Playwright |
| `npm test` | Run unit tests and end-to-end tests |

Before submitting changes, run:

```sh
npm run check
npm run lint
npm test
```

## Project structure

```text
src/
├── lib/
│   ├── Scene.svelte              # 3D scene and optical media
│   └── components/               # Scene geometry and GLSL shaders
└── routes/
    ├── +page.svelte              # Simulator controls and page layout
    └── page.svelte.e2e.ts        # End-to-end smoke test
```

The production build uses the SvelteKit static adapter. Set `BASE_PATH` when
deploying below a path prefix, for example on a project site:

```sh
BASE_PATH=/thin-film-interference-sim npm run build
```

