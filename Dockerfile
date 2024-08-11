FROM python:3.11-slim

WORKDIR /blogSite

COPY requirements.txt /blogSite/

RUN pip install --no-cache-dir -r requirements.txt

COPY . /blogSite/

# Set environment variables for Django
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN python manage.py migrate

RUN python manage.py collectstatic --noinput

# Run the Django development server (change to production command if necessary)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project_name.wsgi:application"]
