FROM alpine:latest

RUN apk update && apk add --no-cache curl bash

CMD ["sh"]