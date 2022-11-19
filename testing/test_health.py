import pytest
from flask.testing import FlaskClient
from app import app

@pytest.fixture
def client():
    return app.test_client()
    
def test_home(client: FlaskClient):
    """should be a successful GET request"""
    resp = client.get('/health')
    assert resp.status_code == 200
    assert isinstance(resp.json, dict)
    assert resp.json.get('status', 'ok')