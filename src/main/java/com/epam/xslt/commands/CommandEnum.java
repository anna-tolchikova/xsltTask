package com.epam.xslt.commands;

import com.epam.xslt.commands.impl.AddProductCommand;
import com.epam.xslt.commands.impl.CategoriesCommand;
import com.epam.xslt.commands.impl.EmptyCommand;
import com.epam.xslt.commands.impl.ProductsCommand;
import com.epam.xslt.commands.impl.SaveProductCommand;
import com.epam.xslt.commands.impl.SubcategoriesCommand;

public enum CommandEnum {
	EMPTY {
		{
			this.command = new EmptyCommand();
		}
	},
	CATEGORIES {
		{
			this.command = new CategoriesCommand();
		}
	},
	SUBCATEGORIES {
		{
			this.command = new SubcategoriesCommand();
		}
	},
	PRODUCTS {
		{
			this.command = new ProductsCommand();
		}
	},
	ADD {
		{
			this.command = new AddProductCommand();
		}
	}, 
	SAVE {
		{
			this.command = new SaveProductCommand();
		}
	};

	ICommand command;

	public ICommand getCommand() {
		return this.command;
	}
}
