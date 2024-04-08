import subprocess

def test_signup():
    # Test with valid form data
    valid_data = {
        'username': 'olivia47',
        'dob': '2003-07-01',
        'fname': 'Olivia',
        'lname': 'Laff'
    }
    curl_command = f"curl -X POST -d 'username={valid_data['username']}&dob={valid_data['dob']}&fname={valid_data['fname']}&lname={valid_data['lname']}' http://localhost:8080/signup"
    result = subprocess.run(curl_command, shell=True, capture_output=True)
    assert result.returncode == 0

    invalid_data = {
        'username': '',
        'dob': '1990-01-01',
        'fname': 'John',
        'lname': 'Doe'
    }
    curl_command = f"curl -X POST -d 'username={invalid_data['username']}&dob={invalid_data['dob']}&fname={invalid_data['fname']}&lname={invalid_data['lname']}' http://localhost:5000/signup"
    result = subprocess.run(curl_command, shell=True, capture_output=True)
    assert result.returncode == 0

    # Test GET request
    curl_command = "curl http://localhost:8080/signup"
    result = subprocess.run(curl_command, shell=True, capture_output=True)
    assert result.returncode == 0

if __name__ == '__main__':
    test_signup()