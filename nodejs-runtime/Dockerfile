#
# Node.js runtime Dockerfile
#
# https://github.com/oocoder/nodejs-runtime
#

# Pull base image.
FROM oocoder/nodejs

# Set instructions on build.
ONBUILD COPY package.json /app/
ONBUILD RUN npm install
ONBUILD COPY . /app

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["npm", "start"]

# Expose ports.
EXPOSE 3000