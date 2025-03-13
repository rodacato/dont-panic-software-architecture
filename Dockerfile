# Usa una imagen base ligera con soporte para Rust
FROM rust:latest AS builder

# Instalar mdBook y sus complementos
RUN cargo install mdbook mdbook-mermaid mdbook-pdf

# Crear un usuario sin privilegios para evitar problemas de permisos
RUN useradd -ms /bin/bash mdbook
USER mdbook
WORKDIR /home/mdbook/app

# Copiar el proyecto a la imagen
COPY . .

# Exponer el puerto donde se servirá el libro
EXPOSE 3000

# Comando por defecto para servir el libro en tiempo real
CMD ["mdbook", "serve", "--hostname", "0.0.0.0"]
