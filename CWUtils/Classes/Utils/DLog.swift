//
//  DLog.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import Foundation

private func filename(_ path: String) -> String {
    guard let filename = path.split(separator: "/").last else { return path }
    return String(filename.prefix(upTo: filename.index(filename.endIndex, offsetBy: -6)))
}

private func functionName(_ function: String) -> String {
    guard let functionName = function.split(separator: "(").first else { return function }
    return String(functionName)
}

public func VLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    print("📢 [\(filename(file))]\(functionName(function))(\(line)): \(message)")
}

public func DLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    print("🐞 [\(filename(file))]\(functionName(function))(\(line)): \(message)")
}

public func DLog<T>(with m: () -> T, file: String = #file, function: String = #function, line: Int = #line) {
    print("🐞 [\(filename(file))]\(functionName(function))(\(line)): \(m())")
}

public func SLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    print("📣 [\(filename(file))]\(functionName(function))(\(line)): \(message)")
}

public func WLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    print("⚠️ [\(filename(file))]\(functionName(function))(\(line)): \(message)")
}

public func ELog(error: Error, file: String = #file, function: String = #function, line: Int = #line) {
    print("🚫 [\(filename(file))]\(functionName(function))(\(line)): \(error.localizedDescription)")
}

public func ELog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    print("🚫 [\(filename(file))]\(functionName(function))(\(line)): \(message)")
}
