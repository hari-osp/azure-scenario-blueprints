# blueprint-engine/__init__.py

"""
Blueprint Engine

This module provides utilities to parse scenario-based input and generate
Terraform code for Azure infrastructure.

Modules:
- engine: Command-line handler for blueprint generation.
- parser: Scenario parser that composes the Terraform blueprint.
"""

from .engine import generate_blueprint
from .parser import parse_scenario

__all__ = ["generate_blueprint", "parse_scenario"]
