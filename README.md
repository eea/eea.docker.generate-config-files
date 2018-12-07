# eea.docker.generate-config-files
Docker image to create files using environment variable values

## Variables

*FILE_CONTENTS_<IDENTIFIER>*, *FILE_LOCATION_<IDENTIFIER>* - will write the value of `FILE_CONTENTS_<IDENTIFIER>` to the value `FILE_LOCATION_<IDENTIFIER>`

## Usage

The file locations should be used in volumes, for example:

     docker run -v volume_name:/mounted -e FILE_CONTENTS_1="test1" -e FILE_LOCATION_1="/mounted/docker1.config" -e FILE_CONTENTS_2="test2" -e FILE_LOCATION_2="/mounted/docker2.config"  -d --name generate_config eeacms/generate-config-files

