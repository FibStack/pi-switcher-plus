# Always prefer setuptools over distutils
from setuptools import setup, find_packages

# To use a consistent encoding
from codecs import open
from os import path

# The directory containing this file
HERE = path.abspath(path.dirname(__file__))

# Get the long description from the README file
with open(path.join(HERE, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

# This call to setup() does all the work
setup(
    name="fibstacklibpy",
    version="0.3.2",
    description="Library to interact with Fibstack boards.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="http://fibstack.com",
    author="alexandru.botnaru",
    author_email="contact@fibstack.com",
    license="Comercial",
    classifiers=[
        "Intended Audience :: Developers",
        "License :: Other/Proprietary License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Operating System :: POSIX :: Linux"
    ],
    packages=["fibstacklibpy"],
    include_package_data=True,
    install_requires=["cffi", "flask", "flask-cors"]
)
