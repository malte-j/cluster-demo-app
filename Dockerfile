FROM node:16-alpine

ENV NODE_ENV=production

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY tsconfig.json .
COPY index.ts ./
RUN npm run build

ENV HOST=0.0.0.0
CMD ["node", "./dist/index"]
