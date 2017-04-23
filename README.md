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

#### Method

GET

#### Parameters

None.

#### Example

`http://localhost:1880/api/app?method=getJardins`

### `getJardin`

Returns informations about a Jardin.

#### Method

GET

#### Parameters

- `id`: The ID of the Jardin

#### Example

`http://localhost:1880/api/app?method=getJardin&id=1`

### `addMeasure`

Allow sensors to add a new measure.

#### Method

POST

#### Input

- `plantation` (`number`) : The ID of the concerned plantation
- `data` (`array`) : An array of the measures to add for this plantation, containing objects of the following structure:
    - `measureType` (`string`) : the measure type, for example `temperature`, `moisture` or `luminosity`
    - `value` (`number`) : the corresponding value, the unit depends on the measure type

#### Example
##### URL
`http://localhost:1880/api/sensor?method=addMeasure`

##### Body

    {
        "plantation": 13,
        "data": [
            {
                "measureType": "temperature",
                "value": 24.5
            },
            {
                "measureType": "moisture",
                "value": 67.6
            }
        ]
    }
