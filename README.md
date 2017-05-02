# Veggicity backend

This is the backend part of the Veggicity mobile app. It defines a RESTful API managed by a Node-RED server.

## Install

First install the required dependencies by running:

    npm i

Then, the server can be launched by running:

    npm start

You can now access the server's flow at http://localhost:1880.

## API

The server offers the following API, respecting this URL format: `http://server/api/[resource]/[optional identifier]`.

- [`jardin`](#jardin)
    * [Get all the gardens](#get-all-the-gardens)
    * [Get a single garden](#get-a-single-garden)
    * [Get the plantations of a garden](#get-the-plantations-of-a-garden)
    * [Add a garden](#add-a-garden)
- [`plantation`](#plantation)
    * [Get a single plantation](#get-a-single-plantation)
    * [Add a plantation](#add-a-plantation)
- [`species`](#species)
    * [Get a single species](#get-a-single-species)
- [`measure`](#measure)
    * [Get the measures available for a plantation](#get-the-measures-available-for-a-plantation)
    * [Add a measure](#add-a-measure)

### `jardin`

#### Get all the gardens

- Method: GET
- URL: `http://[server]/api/jardin`
- Example URL: `http://localhost:1880/api/jardin`

#### Get a single garden

- Method: GET
- URL: `http://[server]/api/jardin/[garden identifier]`
- Example URL: `http://localhost:1880/api/jardin/1`

#### Get the plantations of a garden

- Method: GET
- URL: `http://[server]/api/jardin/[garden identifier]/plantation`
- Example URL : `http://localhost:1880/api/jardin/1/plantation`

#### Add a garden

- Method: POST
- URL: `http://[server]/api/jardin`
- Body:
    - `name` (`string`) : The name to give to this plantation
    - `position` (`object`) : The GPS position of the garden, containing:
        - `lat` (`number`) : the latitude of the garden
        - `lon` (`number`) : the longitude of the garden
        
- Example URL: `http://localhost:1880/api/jardin`
- Example Body:
    ```
    {
        "name": "Le Doua Vert",
        "position": {
            "lat": 45.784001,
            "lon": 4.872478
        }
    }
    ```

### `plantation`

#### Get a single plantation

- Method: GET
- URL: `http://[server]/api/plantation/[plantation identifier]`
- Example URL: `http://localhost:1880/api/plantation/1`

#### Add a plantation

- Method: POST
- URL: `http://[server]/api/plantation`
- Body:
    - `name` (`string`) : The name to give to this plantation
    - `date` (`string`) : The date of plantation, following the format YYYY-MM-DD
    - `jardin` (`number`) : the ID of the jardin containing this plantation
    - `species` (`number`) : the ID of this plantation species
- Example URL: `http://localhost:1880/api/plantation`
- Example Body:
    ```
    {
        "name": "Laitue de mamie",
        "species": 2,
        "jardin": 3,
        "date": "2017-04-29"
    }
    ```

### `species`

#### Get a single species

- Method: GET
- URL: `http://[server]/api/species/[species identifier]`
- Example URL: `http://localhost:1880/api/species/1`

### `measure`

#### Get the measures available for a plantation

- Method: GET
- URL: `http://[server]/api/plantation/[plantation identifier]/measure`
- Example URL: `http://localhost:1880/api/plantation/1/measure`

#### Add a measure

- Method: POST
- URL: `http://[server]/api/measure`
- Body:
    - `plantation` (`number`) : The ID of the concerned plantation
    - `temperature` (`number`) : the temperature measure on the plantation
    - `moisture` (`number`) : the moisture measure on the plantation
- Example URL: `http://localhost:1880/api/measure`
- Example Body:
    ```
    {
        "plantation": 13,
        "temperature": 25.4,
        "moisture": 69.5
    }
    ```
