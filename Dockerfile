FROM node:lts-alpine

ENV NODE_ENV=production
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY tsconfig.json .
COPY index.ts ./
RUN npm run build

CMD ["npm", "run", "run"]