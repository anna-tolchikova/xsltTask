package com.epam.xslt.commands.impl;

import java.util.HashMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

abstract class BaseCommand {

	private final static ReadWriteLock rwl = new ReentrantReadWriteLock();
	protected final static Lock readLock = rwl.readLock();
	protected final static Lock writeLock = rwl.writeLock();
}
