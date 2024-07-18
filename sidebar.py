#!/usr/bin/python

import importlib

from FinderSidebarEditor import FinderSidebar                  # Import the module

sidebar = FinderSidebar()                                      # Create a Finder sidebar instance to act on.

sidebar.add("~/")                                              # You can escape the slash. Use \\ and you get just one slash
sidebar.move("~/", "Downloads")
sidebar.add("~/Library/Mobile\\ Documents/com\\~apple\\~CloudDocs/Server")
sidebar.move("~/Library/Mobile\\ Documents/com\\~apple\\~CloudDocs/Server" , "iCloud")