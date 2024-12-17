# Utilisation de l'image officielle de Python comme base
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier requirements.txt et le code de l'API
COPY . /app

# Installer les dépendances
RUN pip install -r requirements.txt

# Exposer le port 5000
EXPOSE 5000

# Commande pour démarrer l'API
CMD ["python", "app.py"]
