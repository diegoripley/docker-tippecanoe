![CI](https://ci.diegoripley.ca/api/v1/teams/main/pipelines/tippecanoe/badge)

# docker-tippecanoe
Docker image for [tippecanoe](https://github.com/mapbox/tippecanoe)

## Usage

```bash
docker run -it --rm \
    -v (pwd):/data \
    tippecanoe --output=/data/output.mbtiles /data/input.geojson
```
