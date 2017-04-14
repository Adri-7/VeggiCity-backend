# Veggicity backend

This is the backend part of the Veggicity mobile app. It defines a REST API managed by a Node-RED server.

## Install

First install the required dependencies by running:

    npm i

Then, the server can be launched by running:

    npm start

You can now access the server's flow at http://localhost:1880.

## API

The server offers the following API endpoints:

### `getJardins`

Returns the list of Jardins in database.

#### Parameters

None.

#### Example

`http://localhost:1880/api/app?method=getJardins`

### `getJardin`

Returns informations about a Jardin.

#### Parameters

- `id`: The ID of the Jardin

#### Example

`http://localhost:1880/api/app?method=getJardin&id=1`