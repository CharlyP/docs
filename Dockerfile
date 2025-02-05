FROM node:16.17.0

RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app
COPY . .

RUN npm ci && npm cache clean --force
RUN npm run build

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=80
ENV PORT=80

EXPOSE 80

ENTRYPOINT ["node", ".output/server/index.mjs"]
