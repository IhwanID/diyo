import 'package:flutter/material.dart';

enum TableState {
  available,
  seated,
  ordered, 
  billing
}

extension TableStateExtension on TableState {
  String get displayTitle {
    switch (this) {
      case TableState.available:
      return "Available";
       case TableState.billing:
      return "Billing";
       case TableState.ordered:
      return "Ordered";
       case TableState.seated:
      return "Seated";
    }
  }

  Color get fillColor {
    switch (this) {
      case TableState.available:
      return Colors.white;
       case TableState.billing:
      return Colors.blue;
       case TableState.ordered:
      return Colors.yellow;
       case TableState.seated:
      return Colors.red;
    }
  }

  Color get borderColor {
    switch (this) {
      case TableState.available:
      return Colors.red;
       case TableState.billing:
      return Colors.blue;
       case TableState.ordered:
      return Colors.yellow;
       case TableState.seated:
      return Colors.red;
    }
  }

  Color get foregroundColor {
    switch (this) {
      case TableState.available:
      return Colors.red;
       case TableState.billing:
      return Colors.white;
       case TableState.ordered:
      return Colors.white;
       case TableState.seated:
      return Colors.white;
    }
  }
  
}