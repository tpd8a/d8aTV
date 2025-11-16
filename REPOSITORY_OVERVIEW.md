# DashboardKit Repository Overview

## Main Purpose

**DashboardKit** (also referred to as d8aTv) is a Swift framework designed for **managing and rendering Splunk dashboards on macOS and tvOS**. The repository provides:

- Parsing and management of Splunk dashboards in multiple formats (Dashboard Studio JSON and legacy SimpleXML)
- Bidirectional conversion between dashboard formats
- CoreData-based persistence with full fidelity preservation
- Search execution tracking with historical result storage
- Extensible architecture for multiple data sources (Splunk, Elastic, Prometheus)
- CLI tools and GUI applications for dashboard interaction

## Key Directories and Their Purposes

### Sources/

#### /DashboardKit/
Core framework library (main product)
- **/CoreData/** - CoreData model definition (DashboardModel.xcdatamodeld)
- **/DataSources/** - Data source implementations (SplunkDataSource.swift)
- **/Managers/** - CoreData management (CoreDataManager.swift)
- **/Models/** - Data models for Dashboard Studio and SimpleXML formats
- **/Parsers/** - JSON/XML parsers for both dashboard formats
- **/Protocols/** - Interfaces (DataSourceProtocol.swift)

#### /d8aTvCore/
Legacy/alternative implementation with additional utilities
- Token management, XML parsing utilities, Splunk integration
- Contains multiple markdown documentation files

#### /SplunkDashboardCLI/
Command-line interface tool
- ArgumentParser-based CLI for loading and querying dashboards

#### /DashboardMonitorApp/
macOS application example
- SwiftUI-based dashboard monitoring application

#### /DashboardMonitorUI/
UI components module
- Reusable SwiftUI views (DashboardMonitorView, DashboardRefreshWorker)

### Examples/
Sample dashboard files
- `dashboard_studio_example.json` - Dashboard Studio format example
- `simple_xml_example.xml` - SimpleXML format example
- `coredata_example_new_schema.json` - CoreData schema example
- `SCHEMA_COMPARISON.md` - Documentation comparing schemas

### Tests/
Test suite
- `/DashboardKitTests/` - Unit tests for the framework

### docs/
Additional documentation
- `ARCHITECTURE.md` - System architecture documentation
- `/examples/` - Additional examples

## Main Files and Their Functions

### Root Level
- **Package.swift** - Swift Package Manager configuration; defines DashboardKit library for macOS 14+ and tvOS 17+
- **README.md** - Comprehensive documentation (407 lines)
- **DASHBOARD_LOADER_README.md** - CLI tool documentation
- **RUN_TESTS.md** - Testing instructions
- **LICENSE** - MIT License (2024)
- **.gitignore** - Standard Swift/Xcode ignores plus CoreData database files

### DashboardKit Core Files
- **DashboardKit.swift** - Framework entry point with public API exports
- **CoreDataManager.swift** - Manages CoreData stack and persistence operations
- **DashboardStudioParser.swift** - Parses Splunk 10+ Dashboard Studio JSON format
- **SimpleXMLParser.swift** - Parses legacy SimpleXML dashboards
- **DashboardStudioModels.swift** - Swift structs for Dashboard Studio format
- **SimpleXMLModels.swift** - Swift structs for SimpleXML format
- **DashboardConverter.swift** - Bidirectional format conversion
- **SplunkDataSource.swift** - Splunk REST API client implementation
- **DataSourceProtocol.swift** - Protocol defining data source capabilities

### CoreData Schema
Defines 8 entities:
- Dashboard
- DataSource
- Visualization
- DashboardLayout
- LayoutItem
- DashboardInput
- SearchExecution
- SearchResult
- DataSourceConfig

Comprehensive relationships for dashboard structure and execution history.

## Programming Languages and Frameworks

### Primary Language
- **Swift 6.0** (modern concurrency with async/await and actors)

### Frameworks & Technologies
- **CoreData** - For persistent storage and data modeling
- **Foundation** - Core Swift foundation framework
- **SwiftUI** - For GUI applications (DashboardMonitorApp/UI)
- **Combine** - Reactive programming for data streams
- **ArgumentParser** - CLI argument parsing
- **CryptoKit** - SHA256 hashing for change detection
- **XMLParser** - Built-in XML parsing

### Platform Support
- macOS 14+ (v26 referenced in README)
- tvOS 17+ (v26 referenced in README)

### Build System
- Swift Package Manager (SPM)

## Notable Patterns and Architecture

### Architectural Patterns

#### 1. Multi-Format Support Architecture
- Abstract data models with format-agnostic CoreData schema
- Separate parsers for each format (DashboardStudioParser, SimpleXMLParser)
- Bidirectional converters between formats
- All formats mapped to unified CoreData entities

#### 2. Protocol-Oriented Design
- DataSourceProtocol defines interface for Splunk/Elastic/Prometheus
- Sendable protocols for Swift 6 concurrency safety
- Actor-based CoreDataManager for thread-safe operations

#### 3. Layered Architecture
```
GUI Layer (SwiftUI Apps)
     ↓
Framework Layer (DashboardKit)
     ↓
Data Layer (CoreData)
     ↓
Network Layer (DataSource implementations)
```

#### 4. Historical Tracking Pattern
- SearchExecution entity tracks all search executions
- SearchResult entity stores historical results
- Enables timeline features not available in web-based dashboards

#### 5. Token System
- Token extraction from dashboard definitions
- Token substitution in search queries
- Dependency resolution with topological sorting
- State management with Combine publishers

#### 6. Extensibility Points
- DataSourceProtocol allows adding new backends (Elastic, Prometheus)
- Parser abstraction supports new dashboard formats
- Converter pattern enables format migrations

#### 7. CLI Pattern
- ArgumentParser-based command structure
- Subcommands for load, query, clear operations
- Rich query capabilities (list, show, find-tokens, stats)

#### 8. Data Fidelity
- Stores raw JSON/XML alongside parsed structures
- SHA256 hashing for duplicate detection
- Preserves all attributes through optionsJSON fields

## Key Design Decisions

- **Swift 6 concurrency model** (async/await, actors)
- **CoreData for robust persistence** vs in-memory only
- **Dual format support** (backwards compatibility with SimpleXML)
- **Historical result storage** (unique feature vs web dashboards)
- **Framework + CLI + GUI apps** (multiple consumption patterns)

## Code Statistics

- 31 Swift files total
- ~1,422 lines in key DashboardKit components
- 16 markdown documentation files
- Comprehensive example files for both formats

## Summary

This is a well-architected Swift framework for enterprise dashboard management with clear separation of concerns, extensible design, and production-ready features like persistence, historical tracking, and multi-format support.
