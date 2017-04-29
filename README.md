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

- Application endpoints
    * [`getJardins`](#getjardins)
    * [`getJardin`](#getjardin)
    * [`getPlantation`](#getplantation)
    * [`addPlantation`](#addplantation)
- Sensors endpoints
    * [`addMeasure`](#addmeasure)

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

### `getPlantation`

Returns informations about a Plantation.

#### Method

GET

#### Parameters

- `id`: The ID of the Plantation

#### Example

`http://localhost:1880/api/app?method=getPlantation&id=1`

### `addPlantation`

Allow to register a new plantation.

#### Method

POST

#### Input

- `name` (`string`) : The name to give to this plantation
- `date` (`string`) : The date of plantation, following the format YYYY-MM-DD
- `jardin` (`number`) : the ID of the jardin containing this plantation
- `species` (`number`) : the ID of this plantation species

#### Example
##### URL
`http://localhost:1880/api/app?method=addPlantation`

##### Body

    {
        "name": "Laitue de mamie",
        "species": 2,
        "jardin": 3,
        "date": "2017-04-29"
    }

### `addMeasure`

Allow sensors to add a new measure.

#### Method

POST

#### Input

- `plantation` (`number`) : The ID of the concerned plantation
- `temperature` (`number`) : the temperature measure on the plantation
- `moisture` (`number`) : the moisture measure on the plantation

#### Example
##### URL
`http://localhost:1880/api/sensor?method=addMeasure`

##### Body

    {
        "plantation": 13,
        "temperature": 25.4,
        "moisture": 69.5
    }
