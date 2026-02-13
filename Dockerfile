# 1. Use an official Python base image (slim versions are smaller and faster)
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the requirements file first to leverage Docker's cache
COPY requirements.txt .

# 4. Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application files
COPY . .

# 6. Tell Docker which port the container listens on at runtime
EXPOSE 5000

# 7. Define the command to run your Flask app
# (Assuming your main file is named app.py)
CMD ["python", "app.py"]