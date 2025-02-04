import os

from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', f"project.settings.{os.getenv('DJANGO_ENV', 'dev')}")

application = get_asgi_application()
