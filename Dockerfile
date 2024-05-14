# Stage 1: Build the NestJS application
FROM node:18 AS build

WORKDIR /usr/app

# Copy package.json and yarn.lock to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code to the working directory
COPY . .

# Build the NestJS application
RUN npm run build

# Stage 2: Create the production image
FROM node:18-alpine AS production

WORKDIR /usr/app

# Copy only necessary files from the build stage
COPY --from=build /usr/app/node_modules ./node_modules
COPY --from=build /usr/app/dist ./dist
COPY --from=build /usr/app/client ./client
COPY --from=build /usr/app/package.json ./

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "dist/main.js"]
