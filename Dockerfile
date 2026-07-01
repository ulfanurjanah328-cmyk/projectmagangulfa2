# ============================================
# Dockerfile untuk Aplikasi PHP
# ============================================

# 1. Pake image PHP dengan Apache
FROM php:8.2-apache

# 2. Install ekstensi yang dibutuhkan
RUN docker-php-ext-install \
    mysqli \
    pdo \
    pdo_mysql \
    && docker-php-ext-enable pdo_mysql

# 3. Enable mod_rewrite (buat routing)
RUN a2enmod rewrite

# 4. Copy semua file ke folder /var/www/html/
COPY . /var/www/html/

# 5. Set permission
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# 6. Set working directory
WORKDIR /var/www/html

# 7. Expose port 80
EXPOSE 80