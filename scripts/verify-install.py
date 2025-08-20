#!/usr/bin/env python3
"""
Slide Agent Installation Verification Script
Checks all components are properly installed and configured
"""

import os
import sys
import json
import subprocess
from pathlib import Path

class Colors:
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BLUE = '\033[94m'
    ENDC = '\033[0m'

def check_mark(status):
    return f"{Colors.GREEN}✓{Colors.ENDC}" if status else f"{Colors.RED}✗{Colors.ENDC}"

def print_status(component, status, details=""):
    mark = check_mark(status)
    status_text = f"{Colors.GREEN}OK{Colors.ENDC}" if status else f"{Colors.RED}FAILED{Colors.ENDC}"
    print(f"  {mark} {component}: {status_text} {details}")
    return status

def check_python_packages():
    """Check required Python packages are installed"""
    required_packages = [
        'python-pptx',
        'mcp',
        'pydantic',
        'httpx',
        'pillow',
        'matplotlib',
        'pandas'
    ]
    
    print(f"\n{Colors.BLUE}Checking Python packages...{Colors.ENDC}")
    all_ok = True
    
    for package in required_packages:
        try:
            __import__(package.replace('-', '_'))
            print_status(package, True)
        except ImportError:
            print_status(package, False)
            all_ok = False
    
    return all_ok

def check_node_packages():
    """Check required Node.js packages"""
    print(f"\n{Colors.BLUE}Checking Node.js packages...{Colors.ENDC}")
    
    # Check Claude Code CLI
    claude_installed = subprocess.run(
        ['which', 'claude'],
        capture_output=True,
        text=True
    ).returncode == 0
    
    print_status("Claude Code CLI", claude_installed)
    return claude_installed

def check_directories():
    """Check required directories exist"""
    print(f"\n{Colors.BLUE}Checking directory structure...{Colors.ENDC}")
    
    project_root = Path(__file__).parent.parent
    required_dirs = [
        'agents',
        'config',
        'hooks',
        'templates',
        'scripts',
        'examples',
        'mcp-servers'
    ]
    
    all_ok = True
    for dir_name in required_dirs:
        dir_path = project_root / dir_name
        exists = dir_path.exists() and dir_path.is_dir()
        print_status(f"Directory: {dir_name}", exists)
        all_ok = all_ok and exists
    
    return all_ok

def check_configuration_files():
    """Check required configuration files"""
    print(f"\n{Colors.BLUE}Checking configuration files...{Colors.ENDC}")
    
    project_root = Path(__file__).parent.parent
    required_files = [
        'config/mcp-config.json',
        'CLAUDE.md',
        'README.md',
        'docker-compose.yml',
        'Dockerfile'
    ]
    
    all_ok = True
    for file_path in required_files:
        full_path = project_root / file_path
        exists = full_path.exists() and full_path.is_file()
        print_status(f"File: {file_path}", exists)
        all_ok = all_ok and exists
    
    return all_ok

def check_agents():
    """Check agent configurations"""
    print(f"\n{Colors.BLUE}Checking agent configurations...{Colors.ENDC}")
    
    project_root = Path(__file__).parent.parent
    agents_dir = project_root / 'agents'
    
    required_agents = [
        'slide-creator.json',
        'content-researcher.json',
        'design-optimizer.json'
    ]
    
    all_ok = True
    for agent_file in required_agents:
        agent_path = agents_dir / agent_file
        if agent_path.exists():
            try:
                with open(agent_path, 'r') as f:
                    config = json.load(f)
                    valid = 'name' in config and 'workflow' in config
                    print_status(f"Agent: {agent_file}", valid)
                    all_ok = all_ok and valid
            except json.JSONDecodeError:
                print_status(f"Agent: {agent_file}", False, "(Invalid JSON)")
                all_ok = False
        else:
            print_status(f"Agent: {agent_file}", False, "(Not found)")
            all_ok = False
    
    return all_ok

def check_mcp_servers():
    """Check MCP server installations"""
    print(f"\n{Colors.BLUE}Checking MCP servers...{Colors.ENDC}")
    
    project_root = Path(__file__).parent.parent
    
    # Check if PowerPoint MCP server directory exists
    ppt_server = project_root / 'mcp-servers' / 'powerpoint-mcp'
    ppt_exists = ppt_server.exists()
    print_status("PowerPoint MCP Server", ppt_exists)
    
    return ppt_exists

def check_environment():
    """Check environment variables"""
    print(f"\n{Colors.BLUE}Checking environment...{Colors.ENDC}")
    
    project_root = Path(__file__).parent.parent
    env_file = project_root / '.env'
    
    if env_file.exists():
        print_status(".env file", True)
        
        # Check for key variables (optional)
        optional_vars = [
            'OPENAI_API_KEY',
            'ANTHROPIC_API_KEY',
            'TAVILY_API_KEY',
            'GITHUB_TOKEN'
        ]
        
        with open(env_file, 'r') as f:
            env_content = f.read()
            
        for var in optional_vars:
            configured = f"{var}=" in env_content and f"{var}=\n" not in env_content
            status = "Configured" if configured else "Not set (optional)"
            print(f"    • {var}: {status}")
    else:
        print_status(".env file", False, "(Using defaults)")
    
    return True

def main():
    """Main verification function"""
    print(f"{Colors.BLUE}{'='*50}{Colors.ENDC}")
    print(f"{Colors.BLUE}Slide Agent Installation Verification{Colors.ENDC}")
    print(f"{Colors.BLUE}{'='*50}{Colors.ENDC}")
    
    checks = [
        ("Python Packages", check_python_packages),
        ("Node Packages", check_node_packages),
        ("Directory Structure", check_directories),
        ("Configuration Files", check_configuration_files),
        ("Agent Configurations", check_agents),
        ("MCP Servers", check_mcp_servers),
        ("Environment", check_environment)
    ]
    
    all_passed = True
    results = {}
    
    for name, check_func in checks:
        try:
            results[name] = check_func()
            all_passed = all_passed and results[name]
        except Exception as e:
            print(f"{Colors.RED}Error checking {name}: {e}{Colors.ENDC}")
            results[name] = False
            all_passed = False
    
    # Summary
    print(f"\n{Colors.BLUE}{'='*50}{Colors.ENDC}")
    print(f"{Colors.BLUE}Verification Summary{Colors.ENDC}")
    print(f"{Colors.BLUE}{'='*50}{Colors.ENDC}")
    
    for name, passed in results.items():
        status = f"{Colors.GREEN}PASSED{Colors.ENDC}" if passed else f"{Colors.RED}FAILED{Colors.ENDC}"
        print(f"  {name}: {status}")
    
    print(f"\n{Colors.BLUE}Overall Status:{Colors.ENDC}", end=" ")
    if all_passed:
        print(f"{Colors.GREEN}✓ All checks passed!{Colors.ENDC}")
        print(f"\n{Colors.GREEN}Slide Agent is ready to use!{Colors.ENDC}")
        print(f"\nNext steps:")
        print(f"  1. Start Claude Code: {Colors.YELLOW}claude code{Colors.ENDC}")
        print(f"  2. Create a presentation: {Colors.YELLOW}/slide-create 'Your Topic'{Colors.ENDC}")
        return 0
    else:
        print(f"{Colors.RED}✗ Some checks failed{Colors.ENDC}")
        print(f"\n{Colors.YELLOW}Please run the setup script again or check the errors above.{Colors.ENDC}")
        return 1

if __name__ == "__main__":
    sys.exit(main())