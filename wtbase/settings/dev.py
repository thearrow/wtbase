from .base import *


for template_engine in TEMPLATES:
    template_engine['OPTIONS']['debug'] = True

try:
    from .local import *
except ImportError:
    pass
