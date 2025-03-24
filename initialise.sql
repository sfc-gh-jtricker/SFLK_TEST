--!jinja2
{% from "macros.jinja" import get_environments %}

{%- set environments = get_environments(DEPLOYMENT_TYPE).split(",") -%}

{%- for environment in environments -%}
  CREATE DATABASE {{ environment }}_db;
  USE DATABASE {{ environment }}_db;
  CREATE TABLE {{ environment }}_orders (
    id NUMBER,
    item VARCHAR,
    quantity NUMBER);
  CREATE TABLE {{ environment }}_customers (
    id NUMBER,
    name VARCHAR);
{% endfor %}